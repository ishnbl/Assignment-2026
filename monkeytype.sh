#!/usr/bin/env bash

words=(
  "the" "be" "to" "of" "and" "a" "in" "that" "have" "I"
  "it" "for" "not" "on" "with" "as" "you" "do" "at" "this"
  "but" "his" "by" "from" "they" "we" "say" "her" "she" "or"
  "an" "will" "my" "one" "all" "would" "there" "their" "what" "so"
  "up" "out" "if" "about" "who" "get" "which" "go" "me" "when"
  "make" "can" "like" "time" "no" "just" "him" "know" "take" "people"
  "into" "year" "your" "good" "some" "could" "them" "see" "other" "than"
  "then" "now" "look" "only" "come" "its" "over" "think" "also" "back"
  "after" "use" "two" "how" "our" "work" "first" "well" "way" "even"
  "new" "want" "because" "any" "these" "give" "day" "most" "us"
)

words_hard=("tesseract" "rizu" "altoids" "sukhi" "leo" "vulkan" "nova" "demigod" "magnus" "skippr" "vettel" "jolly" "toshi" "hawkeye" "achilles" "parzival" "june" "chetak" "safari" "cosign" "iris" "blaze" "kronos" "xeon" "kunal" "segfault" "masqrade" "pixel" "vibhatsu" "amx" "flash" "karma" "case" "regie" "kirito" "dhokla" "jenny" "neptune" "tcan" "saturn" "zeb" "ravenholm" "oc" "sky" "ivy" "ignis" "kunrex" "dante" "atreus" "xylo" "ashura" "lalo" "nagi" "ryu" "tentellam" "starkov" "syscall" "kabir" "lime" "bass" "eniac" "sumo" "change" "jules" "kai" "mo" "feral" "serein")

run_func() {
  echo -e "ENIAC'S SPECIAL TYPING TEST\n"
  echo -e "Please choose the mode: 1:Easy 2:Hard\n"
  read mode

  words_in_test=""
  case $mode in
  1)
    for n in {0..60}; do
      var1=$RANDOM
      var2=$(($var1 % 99))
      words_in_test+="${words[var2]} "
    done
    ;;
  2)
    for n in {0..60}; do
      var1=$RANDOM
      var2=$(($var1 % 68))
      words_in_test+="${words_hard[var2]} "
    done
    ;;
  esac

  echo $words_in_test

  echo -e "\n________________________________________________________________________________________________________________________________________\nStart Typing : \n"

  t1=$(date +%s)

  read inp

  t2=$(date +%s)

  del=$((t2 - t1))

  count=0
  non_space=0

  for ((k = 0; k < ${#words_in_test}; k++)); do
    str1=${inp:k:1}
    str2=${words_in_test:k:1}
    if [ "$str2" != " " ]; then
      non_space=$((non_space + 1))
    fi
    if [ "$str1" == "$str2" ] && [ "$str2" != " " ]; then
      count=$((count + 1))
    fi
  done

  mult=$(($count * 100))
  acc=$(($mult / $non_space))

  echo -e "\nACCURACY: $acc%"
  echo "TOTAL TIME: ${del}s"

  wpm=$(((${count} * 12) / del))

  echo "WPM: $wpm"
}

while true; do
  run_func
  echo -e "\n1:Restart   2:Quit"
  read choice
  case ${choice} in
  1)
    echo -e "\n"
    continue
    ;;
  2)
    echo "Goodbye"
    exit 0
    ;;
  esac
done
