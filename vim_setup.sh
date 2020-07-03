# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim \
https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

BUNDLE_DIR="$HOME/.vim/bundle"

# vim-pydocstring
git clone https://github.com/heavenshell/vim-pydocstring.git $BUNDLE_DIR/vim-pydocstring
