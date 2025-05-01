#define ACCENT_NONE "No Accent"
#define ACCENT_DEFAULT "Species Accent"
#define ACCENT_DWARF "Dwarf Accent"
#define ACCENT_DELF "Dark-Elf Accent"
#define ACCENT_TIEFLING "Tiefling Accent"
#define ACCENT_STEPPE "Steppe Accent"
#define ACCENT_HORC "Half-Orc Accent"
#define ACCENT_GRENZ "Grenzelhoft Acccent"
#define ACCENT_ABYSSAL "Abyssal Accent"
#define ACCENT_PIRATE "Pirate Accent"
#define ACCENT_MIDDLE_SPEAK "Middle Speak (Old Half-Orc)"

GLOBAL_LIST_INIT(accent_list, list(
	ACCENT_NONE = list(),
	ACCENT_DEFAULT = list(),
	ACCENT_DWARF = strings("accents/SKdwarf_replacement.json", "dwarf"),
//	ACCENT_DELF = strings("SKdarkelf_replacement.json", "darkelf"),
	ACCENT_TIEFLING = strings("accents/SKtiefling_replacement.json", "tiefling"),
	ACCENT_STEPPE = strings("accents/SKsteppe_replacement.json", "steppe"),
	ACCENT_ABYSSAL = strings("accents/abyssal_replacement.json", "abyssal"),
//	ACCENT_DWARF = strings("accents/dwarf_replacement.json", "dwarf"),
	ACCENT_DELF = strings("accents/french_replacement.json", "french"),
//	ACCENT_ELF = strings("accents/russian_replacement.json", "russian"),
//	ACCENT_TIEFLING = strings("accents/spanish_replacement.json", "spanish"),
//	ACCENT_HORC = strings("accents/halforc_replacement.json", "halforc"),
	ACCENT_GRENZ = strings("accents/SKgrenzelhoft_replacement.json", "grenzelhoft"),
//	ACCENT_PIRATE = strings("accents/pirate_replacement.json", "pirate"),
	ACCENT_MIDDLE_SPEAK = strings("accents/middlespeak.json", "full"),
))
