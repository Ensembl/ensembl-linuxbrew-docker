# Docker image with all necessary Homebrew and Ensembl taps
FROM linuxbrew/brew:3.1.0

# Setup moonshine
ENV HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE /home/linuxbrew/ENSEMBL_MOONSHINE_ARCHIVE
RUN mkdir -p $HOMEBREW_ENSEMBL_MOONSHINE_ARCHIVE

# Turning off autoupdate
ENV HOMEBREW_NO_AUTO_UPDATE 1

# Turn off analytics and tap brew & Ensembl repositories
RUN brew analytics off \
&& brew tap denji/nginx \
&& brew tap ensembl/ensembl \
&& brew tap ensembl/external \
&& brew tap ensembl/moonshine \
&& brew tap ensembl/web \
&& brew tap ensembl/cask \
&& git -C /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/ensembl/homebrew-cask checkout feature/codon_cluster \
&& git -C /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/ensembl/homebrew-ensembl checkout feature/codon_cluster \
&& git -C /home/linuxbrew/.linuxbrew/Homebrew/Library/Taps/ensembl/homebrew-external checkout feature/codon_cluster

RUN brew install ensembl/cask/pre-flight \
&& brew install ensembl/cask/basic-dependencies \
&& brew cleanup \
&& rm -rf /home/linuxbrew/.cpan /home/linuxbrew/.cache/Homebrew
