# Swaplit Plugin

Swaplit is a Vim plugin that allows you to display split numbers and swap splits in your Vim editor. This can be useful for managing multiple splits and improving your workflow.

## Installation

### Using Vim's Native Package Management

Create the necessary directories and clone the repository into the `start` directory:
```sh
mkdir -p ~/.vim/pack/plugins/start
git clone https://github.com/sizvix/swaplit ~/.vim/pack/plugins/start/swaplit
```

## Usage

### Commands
- `:Swaplit`
  - Displays the split numbers for 3 seconds.

- `:Swaplit <split1> <split2>`
  - Swaps the specified splits.

## Example

To display split numbers, simply run:
```vim
:Swaplit
```

To swap split 1 and split 4, run:
```vim
:Swaplit 1 4
```
