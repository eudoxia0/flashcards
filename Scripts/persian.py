from dataclasses import dataclass


@dataclass(frozen=True)
class Letter:
    name: str
    isolated: str
    initial: str
    medial: str
    final: str


LETTERS = [
    Letter(name="alef", isolated="ا", initial="ا", medial="ـا", final="ـا"),
    Letter(name="be", isolated="ب", initial="بـ", medial="ـبـ", final="ـب"),
    Letter(name="pe", isolated="پ", initial="پـ", medial="ـپـ", final="ـپ"),
    Letter(name="te", isolated="ت", initial="تـ", medial="ـتـ", final="ـت"),
    Letter(name="se", isolated="ث", initial="ثـ", medial="ـثـ", final="ـث"),
    Letter(name="jim", isolated="ج", initial="جـ", medial="ـجـ", final="ـج"),
    Letter(name="che", isolated="چ", initial="چـ", medial="ـچـ", final="ـچ"),
    Letter(name="he", isolated="ح", initial="حـ", medial="ـحـ", final="ـح"),
    Letter(name="khe", isolated="خ", initial="خـ", medial="ـخـ", final="ـخ"),
    Letter(name="dal", isolated="د", initial="د", medial="ـد", final="ـد"),
    Letter(name="zal", isolated="ذ", initial="ذ", medial="ـذ", final="ـذ"),
    Letter(name="re", isolated="ر", initial="ر", medial="ـر", final="ـر"),
    Letter(name="ze", isolated="ز", initial="ز", medial="ـز", final="ـز"),
    Letter(name="zhe", isolated="ژ", initial="ژ", medial="ـژ", final="ـژ"),
    Letter(name="sin", isolated="س", initial="سـ", medial="ـسـ", final="ـس"),
    Letter(name="shin", isolated="ش", initial="شـ", medial="ـشـ", final="ـش"),
    Letter(name="sad", isolated="ص", initial="صـ", medial="ـصـ", final="ـص"),
    Letter(name="zad", isolated="ض", initial="ضـ", medial="ـضـ", final="ـض"),
    Letter(name="ta", isolated="ط", initial="طـ", medial="ـطـ", final="ـط"),
    Letter(name="za", isolated="ظ", initial="ظـ", medial="ـظـ", final="ـظ"),
    Letter(name="ain", isolated="ع", initial="عـ", medial="ـعـ", final="ـع"),
    Letter(name="ghain", isolated="غ", initial="غـ", medial="ـغـ", final="ـغ"),
    Letter(name="fe", isolated="ف", initial="فـ", medial="ـفـ", final="ـف"),
    Letter(name="qaf", isolated="ق", initial="قـ", medial="ـقـ", final="ـق"),
    Letter(name="kaf", isolated="ک", initial="کـ", medial="ـکـ", final="ـک"),
    Letter(name="gaf", isolated="گ", initial="گـ", medial="ـگـ", final="ـگ"),
    Letter(name="lam", isolated="ل", initial="لـ", medial="ـلـ", final="ـل"),
    Letter(name="mim", isolated="م", initial="مـ", medial="ـمـ", final="ـم"),
    Letter(name="nun", isolated="ن", initial="نـ", medial="ـنـ", final="ـن"),
    Letter(name="vav", isolated="و", initial="و", medial="ـو", final="ـو"),
    Letter(name="he do cheshm", isolated="ه", initial="هـ", medial="ـهـ", final="ـه"),
    Letter(name="ye", isolated="ی", initial="یـ", medial="ـیـ", final="ـی"),
]

for letter in LETTERS:
    print(f"Q: isolated form of **{letter.name}**")
    print(f"A: # {letter.isolated}\n")
    print(f"Q: initial form of **{letter.name}**")
    print(f"A: # {letter.initial}\n")
    print(f"Q: medial form of **{letter.name}**")
    print(f"A: # {letter.medial}\n")
    print(f"Q: final form of **{letter.name}**")
    print(f"A: # {letter.final}\n")

    print("Q: name of this letter:")
    print(f"# {letter.isolated}")
    print(f"A: {letter.name}\n")
    print("Q: name of this letter:")
    print(f"# {letter.initial}")
    print(f"A: {letter.name}\n")
    print("Q: name of this letter:")
    print(f"# {letter.medial}")
    print(f"A: {letter.name}\n")
    print("Q: name of this letter:")
    print(f"# {letter.final}")
    print(f"A: {letter.name}\n")
