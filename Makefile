NATO     := Cards/NATO\ Phonetic\ Alphabet.md
NATO_SRC := Sources/nato.csv
POW      := Cards/Powers\ of\ Two.md
POW_PY   := Scripts/pow2.py
PY       := python3
TARGETS  := $(NATO) $(POW)
VOCAB    := Scripts/vocab.py

.PHONY: all
all: $(TARGETS)

$(NATO): $(NATO_SRC) $(VOCAB)
	$(PY) $(VOCAB) $(NATO_SRC) > $(NATO)

$(POW):$(POW_PY)
	$(PY) $(POW_PY) > $(POW)

.PHONY: clean
clean:
	rm -f $(TARGETS)

.PHONY: drill
drill:
	RUST_LOG=debug hashcards drill Cards
