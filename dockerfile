FROM haskell:9.4.5

WORKDIR /app

COPY calculadora /app
WORKDIR /app/calculadora

# RUN stack config set system-ghc --global true
# RUN stack setup --install-ghc
RUN stack config set system-ghc --global true
RUN stack install --install-ghc --haddock --test

ENTRYPOINT ["stack", "exec", "calculadora-exe"]