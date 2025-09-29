NATO     := Cards/NATO\ Phonetic\ Alphabet.md
NATO_SRC := Sources/nato.csv
PY       := python3
VOCAB    := Scripts/vocab.py

.PHONY: all
all: $(NATO)

$(NATO): $(NATO_SRC) $(VOCAB)
	$(PY) $(VOCAB) $(NATO_SRC) > $(NATO)

.PHONY: clean
clean:
	rm -f $(NATO)

.PHONY: drill
drill:
	RUST_LOG=debug hashcards drill Cards
