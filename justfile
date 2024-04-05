# Default help menu
_default:
  @just --list

template_path := "gh-dash.tera"
output_base := "themes"

setup:
  mkdir -p {{output_base}}/latte
  mkdir -p {{output_base}}/frappe
  mkdir -p {{output_base}}/macchiato
  mkdir -p {{output_base}}/mocha

clean:
  rm -r {{output_base}}

build: setup
  whiskers {{template_path}}
