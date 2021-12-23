;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))

(deftemplate state-list
   (slot current)
   (multislot sequence))

(deffacts startup
   (state-list))

;;;***********
;;;* STARTUP *
;;;***********

(defrule system-banner ""

  =>

  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;*************
;;;* QUESTIONS *
;;;*************

(defrule determine-with-children ""

   (logical (start))

   =>

   (assert (UI-state (display WithChildrenQuestion)
                     (relation-asserted with-children)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-more-than-two-hours ""

   (logical (with-children No))

   =>

   (assert (UI-state (display MoreThanTwoHoursQuestion)
                     (relation-asserted more-than-two-hours)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-huge-nerd ""

   (logical (more-than-two-hours No))

   =>

   (assert (UI-state (display HugeNerdQuestion)
                     (relation-asserted huge-nerd)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-dozens-of-hours-preparing ""

   (logical (huge-nerd Yes))

   =>

   (assert (UI-state (display DozensOfHoursPreparingQuestion)
                     (relation-asserted dozens-of-hours-preparing)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-like-spending-money ""

   (logical (dozens-of-hours-preparing No))

   =>

   (assert (UI-state (display LikeSpendingMoneyQuestion)
                     (relation-asserted like-spending-money)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-everyone-should-get-along ""

   (logical (huge-nerd No))

   =>

   (assert (UI-state (display EveryoneShouldGetAlongQuestion)
                     (relation-asserted everyone-should-get-along)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-boomer-wet-dreams ""

   (logical (like-spending-money No))

   =>

   (assert (UI-state (display BoomerWetDreamsQuestion)
                     (relation-asserted boomer-wet-dreams)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-secretly-wish-dick ""

   (logical (everyone-should-get-along Yes))

   =>

   (assert (UI-state (display SecretlyWishDickQuestion)
                     (relation-asserted secretly-wish-dick)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-like-gamble ""

   (logical (everyone-should-get-along No))

   =>

   (assert (UI-state (display LikeGambleQuestion)
                     (relation-asserted like-gamble)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-monty-python-fetish ""

   (logical (secretly-wish-dick No))

   =>

   (assert (UI-state (display MontyPythonFetishQuestion)
                     (relation-asserted monty-python-fetish)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-zombies ""

   (logical (monty-python-fetish No))

   =>

   (assert (UI-state (display ZombiesQuestion)
                     (relation-asserted zombies)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-more-than-two-players ""

   (logical (over-fifty-years-old Yes))

   =>

   (assert (UI-state (display MoreThanTwoPlayersQuestion)
                     (relation-asserted more-than-two-players)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-over-fifty-years-old ""

   (logical (like-gamble No))

   =>

   (assert (UI-state (display OverFiftyYearsOldQuestion)
                     (relation-asserted over-fifty-years-old)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-chess-too-cliche ""

   (logical (in-mensa Yes))

   =>

   (assert (UI-state (display ChessTooClicheQuestion)
                     (relation-asserted chess-too-cliche)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-fight-monsters-or-viruses ""

   (logical (zombies No))

   =>

   (assert (UI-state (display FightMonstersOrVirusesQuestion)
                     (relation-asserted fight-monsters-or-viruses)
                     (response Monster)
                     (valid-answers Monster Virus)
           )
   )
)

(defrule determine-in-mensa ""

   (logical (more-than-two-players No))

   =>

   (assert (UI-state (display InMensaQuestion)
                     (relation-asserted in-mensa)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-party-game ""

   (logical (over-fifty-years-old No))

   =>

   (assert (UI-state (display PartyGameQuestion)
                     (relation-asserted party-game)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-get-laid ""

   (logical (party-game Yes))

   =>

   (assert (UI-state (display GetLaidQuestion)
                     (relation-asserted get-laid)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-embarrass-your-friends ""

   (logical (get-laid No))

   =>

   (assert (UI-state (display EmbarrassYourFriendsQuestion)
                     (relation-asserted embarrass-your-friends)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-know-it-all ""

   (logical (party-game No))

   =>

   (assert (UI-state (display KnowItAllQuestion)
                     (relation-asserted know-it-all)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-be-thug-or-artist ""

   (logical (embarrass-your-friends Yes))

   =>

   (assert (UI-state (display BeThugOrArtistQuestion)
                     (relation-asserted be-thug-or-artist)
                     (response Artist)
                     (valid-answers Artist Thug)
           )
   )
)

(defrule determine-creative-liar ""

   (logical (embarrass-your-friends No))

   =>

   (assert (UI-state (display CreativeLiarQuestion)
                     (relation-asserted creative-liar)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-get-straight-as ""

   (logical (know-it-all No))

   =>

   (assert (UI-state (display GetStraightAsQuestion)
                     (relation-asserted get-straight-as)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-words-or-trivia ""

   (logical (creative-liar Yes))

   =>

   (assert (UI-state (display WordsOrTriviaQuestion)
                     (relation-asserted words-or-trivia)
                     (response Trivia)
                     (valid-answers Trivia Words)
           )
   )
)

(defrule determine-enjoy-economics ""

   (logical (train-fetish Yes))

   =>

   (assert (UI-state (display EnjoyEconomicsQuestion)
                     (relation-asserted enjoy-economics)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-good-with-hands ""

   (logical (creative-liar No))

   =>

   (assert (UI-state (display GoodWithHandsQuestion)
                     (relation-asserted good-with-hands)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-train-fetish ""

   (logical (get-straight-as No))

   =>

   (assert (UI-state (display TrainFetishQuestion)
                     (relation-asserted train-fetish)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-farming-fetish ""

   (logical (constant-hard-choices Yes))

   =>

   (assert (UI-state (display FarmingFetishQuestion)
                     (relation-asserted farming-fetish)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-buy-two-games ""

   (logical (farming-fetish No))

   =>

   (assert (UI-state (display BuyTwoGamesQuestion)
                     (relation-asserted buy-two-games)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-words-or-tiles ""

   (logical (simple-rules Yes))

   =>

   (assert (UI-state (display WordsOrTilesQuestion)
                     (relation-asserted words-or-tiles)
                     (response Words)
                     (valid-answers Words Tiles)
           )
   )
)

(defrule determine-simple-rules ""

   (logical (train-fetish No))

   =>

   (assert (UI-state (display SimpleRulesQuestion)
                     (relation-asserted simple-rules)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-constant-hard-choices ""

   (logical (simple-rules No))

   =>

   (assert (UI-state (display ConstantHardChoicesQuestion)
                     (relation-asserted constant-hard-choices)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-card-based ""

   (logical (constant-hard-choices No))

   =>

   (assert (UI-state (display CardBasedQuestion)
                     (relation-asserted card-based)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-complexity ""

   (logical (card-based Yes))

   =>

   (assert (UI-state (display ComplexityQuestion)
                     (relation-asserted complexity)
                     (response Less)
                     (valid-answers Less More)
           )
   )
)

(defrule determine-all-serious-board-game-geeks ""

   (logical (buy-two-games Yes))

   =>

   (assert (UI-state (display AllSeriousBoardGameGeeksQuestion)
                     (relation-asserted all-serious-board-game-geeks)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-plan-strat-before-turn ""

   (logical (card-based No))

   =>

   (assert (UI-state (display PlanStratBeforeTurnQuestion)
                     (relation-asserted plan-strat-before-turn)
                     (response No)
                     (valid-answers No Yes)
           )
   )
)

(defrule determine-turns-or-no-down-time ""

   (logical (plan-strat-before-turn No))

   =>

   (assert (UI-state (display TurnsOrNoDownTimeQuestion)
                     (relation-asserted turns-or-no-down-time)
                     (response Turns)
                     (valid-answers Turns NoDownTime)
           )
   )
)

;;;***********
;;;* RESULTS *
;;;***********

(defrule not-implemented-result ""

   (or
           (logical (with-children Yes))
           (logical (more-than-two-hours Yes))
   )

   =>

   (assert (UI-state (display NotImplementedResult)
                     (state final)
           )
   )
)

(defrule warhammer-result ""

   (logical (dozens-of-hours-preparing Yes))

   =>

   (assert (UI-state (display WarhammerResult)
                     (state final)
           )
   )
)

(defrule magic-result ""

   (logical (like-spending-money Yes))

   =>

   (assert (UI-state (display MagicResult)
                     (state final)
           )
   )
)

(defrule cosmic-encounter-result ""

   (logical (boomer-wet-dreams No))

   =>

   (assert (UI-state (display CosmicEncounterResult)
                     (state final)
           )
   )
)

(defrule battlestar-galactica-result ""

   (logical (boomer-wet-dreams Yes))

   =>

   (assert (UI-state (display BattlestarGalacticaResult)
                     (state final)
           )
   )
)

(defrule shadows-over-camelot-result ""

   (logical (monty-python-fetish Yes))

   =>

   (assert (UI-state (display ShadowsOverCamelotResult)
                     (state final)
           )
   )
)

(defrule last-night-on-earth-result ""

   (logical (zombies Yes))

   =>

   (assert (UI-state (display LastNightOnEarthResult)
                     (state final)
           )
   )
)

(defrule arkham-horror-result ""

   (logical (secretly-wish-dick Yes))

   =>

   (assert (UI-state (display ArkhamHorrorResult)
                     (state final)
           )
   )
)

(defrule rummoli-result ""

   (logical (like-gamble Yes))

   =>

   (assert (UI-state (display RummoliResult)
                     (state final)
           )
   )
)

(defrule cribbage-result ""

   (logical (more-than-two-players Yes))

   =>

   (assert (UI-state (display CribbageResult)
                     (state final)
           )
   )
)

(defrule pandemic-result ""

   (logical (fight-monsters-or-viruses Virus))

   =>

   (assert (UI-state (display PandemicResult)
                     (state final)
           )
   )
)

(defrule backgammon-result ""

   (logical (in-mensa No))

   =>

   (assert (UI-state (display BackgammonResult)
                     (state final)
           )
   )
)

(defrule dungeon-run-result ""

   (logical (fight-monsters-or-viruses Monster))

   =>

   (assert (UI-state (display DungeonRunResult)
                     (state final)
           )
   )
)

(defrule chess-result ""

   (logical (chess-too-cliche No))

   =>

   (assert (UI-state (display ChessResult)
                     (state final)
           )
   )
)

(defrule twister-result ""

   (logical (get-laid Yes))

   =>

   (assert (UI-state (display TwisterResult)
                     (state final)
           )
   )
)

(defrule go-result ""

   (logical (chess-too-cliche Yes))

   =>

   (assert (UI-state (display GoResult)
                     (state final)
           )
   )
)

(defrule cash-n-guns-result ""

   (logical (be-thug-or-artist Thug))

   =>

   (assert (UI-state (display CashNGunsResult)
                     (state final)
           )
   )
)

(defrule cranium-result ""

   (logical (be-thug-or-artist Artist))

   =>

   (assert (UI-state (display CraniumResult)
                     (state final)
           )
   )
)

(defrule trivial-persuit-result ""

   (logical (know-it-all Yes))

   =>

   (assert (UI-state (display TrivialPersuitResult)
                     (state final)
           )
   )
)

(defrule scrabble-result ""

   (logical (get-straight-as Yes))

   =>

   (assert (UI-state (display ScrabbleResult)
                     (state final)
           )
   )
)

(defrule beyond-balderdash-result ""

   (logical (words-or-trivia Words))

   =>

   (assert (UI-state (display BeyondBalderdashResult)
                     (state final)
           )
   )
)

(defrule steam-result ""

   (logical (enjoy-economics Yes))

   =>

   (assert (UI-state (display SteamResult)
                     (state final)
           )
   )
)

(defrule wits-and-wagers-result ""

   (logical (words-or-trivia Trivia))

   =>

   (assert (UI-state (display WitsAndWagersResult)
                     (state final)
           )
   )
)

(defrule ticket-to-ride-result ""

   (logical (enjoy-economics No))

   =>

   (assert (UI-state (display TicketToRideResult)
                     (state final)
           )
   )
)

(defrule jenga-dk-edition-result ""

   (logical (good-with-hands Yes))

   =>

   (assert (UI-state (display JengaDKEditionResult)
                     (state final)
           )
   )
)

(defrule taboo-result ""

   (logical (good-with-hands No))

   =>

   (assert (UI-state (display TabooResult)
                     (state final)
           )
   )
)

(defrule qwirkle-result ""

   (logical (words-or-tiles Tiles))

   =>

   (assert (UI-state (display QwirkleResult)
                     (state final)
           )
   )
)

(defrule agricola-result ""

   (logical (farming-fetish Yes))

   =>

   (assert (UI-state (display AgricolaResult)
                     (state final)
           )
   )
)

(defrule scattergories-result ""

   (logical (words-or-tiles Words))

   =>

   (assert (UI-state (display ScattergoriesResult)
                     (state final)
           )
   )
)

(defrule seven-wonders-result ""

   (logical (complexity More))

   =>

   (assert (UI-state (display SevenWondersResult)
                     (state final)
           )
   )
)

(defrule settlers-of-catan-result ""

   (logical (plan-strat-before-turn Yes))

   =>

   (assert (UI-state (display SettlersOfCatanResult)
                     (state final)
           )
   )
)

(defrule cities-and-knights-result ""

   (logical (buy-two-games No))

   =>

   (assert (UI-state (display CitiesAndKnightsResult)
                     (state final)
           )
   )
)

(defrule dominion-result ""

   (logical (complexity Less))

   =>

   (assert (UI-state (display DominionResult)
                     (state final)
           )
   )
)

(defrule domaine-result ""

   (logical (all-serious-board-game-geeks No))

   =>

   (assert (UI-state (display DomaineResult)
                     (state final)
           )
   )
)

(defrule pillars-of-the-earth-result ""

   (logical (turns-or-no-down-time NoDownTime))

   =>

   (assert (UI-state (display PillarsOfTheEarthResult)
                     (state final)
           )
   )
)

(defrule puerto-rico-result ""

   (logical (all-serious-board-game-geeks Yes))

   =>

   (assert (UI-state (display PuertoRicoResult)
                     (state final)
           )
   )
)

(defrule carcassonne-result ""

   (logical (turns-or-no-down-time Turns))

   =>

   (assert (UI-state (display CarcassonneResult)
                     (state final)
           )
   )
)


;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))

   (UI-state (id ?id))

   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))

   =>

   (modify ?f (current ?id)
              (sequence ?id ?s))

   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))

   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))

   =>

   (retract ?f1)

   (modify ?f2 (current ?nid))

   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))

   ?f <- (next ?id)

   (state-list (sequence ?id $?))

   (UI-state (id ?id)
             (relation-asserted ?relation))

   =>

   (retract ?f)

   (assert (add-response ?id)))

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))

   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))

   (UI-state (id ?id) (response ?response))

   =>

   (retract ?f1)

   (modify ?f2 (current ?nid))

   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))

   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))

   (UI-state (id ?id) (response ~?response))

   ?f2 <- (UI-state (id ?nid))

   =>

   (modify ?f1 (sequence ?b ?id ?e))

   (retract ?f2))

(defrule handle-next-response-end-of-chain

   (declare (salience 10))

   ?f1 <- (next ?id ?response)

   (state-list (sequence ?id $?))

   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))

   =>

   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))

   (assert (add-response ?id ?response)))

(defrule handle-add-response

   (declare (salience 10))

   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))

   ?f1 <- (add-response ?id ?response)

   =>

   (str-assert (str-cat "(" ?relation " " ?response ")"))

   (retract ?f1))

(defrule handle-add-response-none

   (declare (salience 10))

   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))

   ?f1 <- (add-response ?id)

   =>

   (str-assert (str-cat "(" ?relation ")"))

   (retract ?f1))

(defrule handle-prev

   (declare (salience 10))

   ?f1 <- (prev ?id)

   ?f2 <- (state-list (sequence $?b ?id ?p $?e))

   =>

   (retract ?f1)

   (modify ?f2 (current ?p))

   (halt))

