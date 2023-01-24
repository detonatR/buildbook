#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative './buildbook/parser'

Buildbook::Parser.run(ARGV[0], ARGV[1], ARGV[2])
