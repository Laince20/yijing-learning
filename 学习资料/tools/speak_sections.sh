#!/usr/bin/env bash
set -euo pipefail

WRAPPER="/Users/xuhanpeng/Documents/Codex/2026-06-16/new-chat/outputs/codex-speak-qwen"
OUT_DIR="/Users/xuhanpeng/Documents/Codex/2026-06-16/new-chat/outputs/qwen3_tts_spoken"
POST_PLAY_SLEEP="${QWEN_TTS_POST_PLAY_SLEEP:-2}"
MAX_TOKENS="${QWEN_TTS_MAX_TOKENS:-1024}"

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 section1 [section2 ...]" >&2
  exit 2
fi

section_no=0
audio_files=()
for text in "$@"; do
  section_no=$((section_no + 1))
  if [[ -z "${text//[[:space:]]/}" ]]; then
    continue
  fi

  echo "== Section $section_no: generating ==" >&2
  before="$(mktemp)"
  after="$(mktemp)"
  find "$OUT_DIR" -maxdepth 1 -name 'qwen_*.wav' -type f -print 2>/dev/null | sort > "$before" || true

  QWEN_TTS_PLAYBACK=none \
  QWEN_TTS_SAVE=1 \
  QWEN_TTS_MAX_TOKENS="$MAX_TOKENS" \
    "$WRAPPER" "$text" >/tmp/codex_speak_sections.out 2>/tmp/codex_speak_sections.err || {
      cat /tmp/codex_speak_sections.out >&2 || true
      cat /tmp/codex_speak_sections.err >&2 || true
      rm -f "$before" "$after"
      exit 1
    }

  find "$OUT_DIR" -maxdepth 1 -name 'qwen_*.wav' -type f -print 2>/dev/null | sort > "$after" || true
  audio_file="$(comm -13 "$before" "$after" | tail -n 1)"
  rm -f "$before" "$after"

  if [[ -z "$audio_file" || ! -s "$audio_file" ]]; then
    echo "No generated audio file found for section $section_no." >&2
    cat /tmp/codex_speak_sections.err >&2 || true
    exit 1
  fi

  duration="$(/usr/bin/afinfo "$audio_file" 2>/dev/null | awk -F': ' '/estimated duration/ {print $2; exit}')"
  echo "== Section $section_no: ready: $audio_file (${duration:-unknown duration}) ==" >&2
  audio_files+=("$audio_file")
done

section_no=0
for audio_file in "${audio_files[@]}"; do
  section_no=$((section_no + 1))
  duration="$(/usr/bin/afinfo "$audio_file" 2>/dev/null | awk -F': ' '/estimated duration/ {print $2; exit}')"
  echo "== Section $section_no: playing (${duration:-unknown duration}) ==" >&2
  /usr/bin/afplay "$audio_file"
  sleep "$POST_PLAY_SLEEP"
done
