set shell := ["sh", "-c"]
set windows-shell := ["powershell", "-c"]

_main:
    @just --list

prereq:
  uv tool install esphome --force --with pip,wheel,fatfs-ng,littlefs-python

prereq_version version:
  uv tool install esphome=={{ version }} --force  --with pip,wheel,fatfs-ng,littlefs-python

compile:
  esphome compile merv.yaml

version:
    esphome version

clean:
    if (Test-Path ~\.platformio) { \
        Remove-Item ~\.platformio -Recurse -Force; \
        Write-Host ".platformio removed." \
    } else { \
        Write-Host "Nothing to clean." \
    }

