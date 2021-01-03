# copy .vimrc to $HOME
cp .vimrc ~/.vimrc

# Install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors/ && \
curl -LSso ~/.vim/autoload/pathogen.vim \
https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Monokai color scheme
curl https://raw.githubusercontent.com/crusoexia/vim-monokai/master/colors/monokai.vim > ~/.vim/colors/monokai.vim

BUNDLE_DIR="$HOME/.vim/bundle"

# vim-pydocstring
git clone https://github.com/heavenshell/vim-pydocstring.git $BUNDLE_DIR/vim-pydocstring
