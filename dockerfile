FROM haskell:9.4.5

WORKDIR /app

RUN stack config set system-ghc --global true

COPY calculadora /app
WORKDIR /app/calculadora

RUN stack install --install-ghc --haddock --test

ENTRYPOINT ["stack", "exec", "calculadora-exe"]