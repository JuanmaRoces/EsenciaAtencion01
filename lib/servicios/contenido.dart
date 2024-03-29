class Modulo {
  int id;
  String titulo;
  String subtitulo;
  String pathImg;
  List<Audicion> temas;
  Modulo(this.id, this.titulo, this.subtitulo, this.pathImg, this.temas);
}

class Audicion {
  int idModulo;
  int posic;
  int id;
  String titulo;
  String subtitulo;
  String pathImg;
  DateTime fecha;
  String descripcion;
  String urlVideo;
  String pathAudio;
  Audicion(this.idModulo, this.posic, this.id,
    this.titulo, this.subtitulo,
    this.pathImg, this.fecha,
    this.descripcion,
    this.urlVideo, this.pathAudio
  );
}

final List<Modulo> modulos = [
  Modulo(0, 'Atención personal básica', 'Es posible vivir de forma más eficaz si aprendes a evitar distracciones.', 
    'assets/curso-1-1.png', [
      Audicion(0, 0, 1, '1. Introducción', 'La atención es una habilidad.',
        'assets/curso-1-1.png', DateTime(2019, 8, 29),
        'La falta de atención se encuentra tanto en los problemas de aprendizaje en las aulas, '
        'como en el día a día de adultos como tú. No pueden enfocarse en una sola acción o son '
        'incapaces de dormir.\n\n'
        'Es posible vivir de forma más eficaz si aprendes a evitar distracciones, conectas con '
        'tu mundo interior (pensamientos, sentimientos, emociones), y fortaleces la atención a los '
        'detalles. Por supuesto, estás en un entorno social más amplio, así que tu satisfacción y '
        'bienestar repercute favorablemente en los demás.',
        null, 'assets/curso-1-1.mp3',
      ),
      Audicion(0, 1, 2, '2. El sonido y el silencio', 'Atención al sonido y al silencio.',
        'assets/curso-1-2.png', DateTime(2019, 8, 22),
        'Las prácticas de "Atención Consciente" puedes realizarlas a cualquier hora del día o haciendo '
        'cualquier actividad. Sin embargo hacer la primera práctica de atención formal, significa que '
        'escojas un lugar tranquilo, un lugar donde puedas evitar las distracciones y reserves un '
        'tiempo para ello.\n\n'
        'Pueden ser 10 minutos. Solo necesitas una silla, la intención y la respiración. Es un tiempo que '
        'te dedicas, en el que te prestas atención de manera consciente y en el que te estás cuidando.',
        null, 'assets/curso-1-2.mp3',
      ),
      Audicion(0, 2, 3, '3. El cuerpo', 'Atención consciente al cuerpo.',
        'assets/curso-1-3.png', DateTime(2019, 8, 29),
        'Puede que utilices tu cuerpo como un mero instrumento. Quizá quieras dar y comenzar a prestarle '
        'Atención. Esa es mi propuesta porque hay una íntima conexión entre tu cuerpo y tu mente, así que con '
        'cada práctica de Atención te acercas más a tu bienestar mental.\n\n'
        'Esta es una práctica formal, escoge un lugar tranquilo, un rincón donde puedas evitar las distracciones '
        'y reserva un tiempo para ella.',
        null, 'assets/curso-1-3.mp3',
      ),
      Audicion(0, 3, 4, '4. La Respiración', 'Atención consciente a la respiración.',
        'assets/curso-1-4.png', DateTime(2019, 8, 29),
        'Si vives, respiras. La respiración es una gran herramienta que traes de serie y puedes aprender '
        'a usarla para algo más que sobrevivir.\n\n'
        'Escoge un lugar tranquilo para tu práctica formal, un lugar sin distracciones donde dedicarte '
        'estos minutos. Acompáñate desde la amabilidad, con curiosidad y aceptación de todo lo que en ti '
        'aparezca porque ahí reside la compasión y la autoestima. Solo necesitas una silla, la intención y la respiración.',
        null, 'assets/curso-1-4.mp3',
      ),
      Audicion(0, 4, 5, '5. La Emoción', 'Atención consciente a la emoción.',
        'assets/curso-1-5.png', DateTime(2019, 8, 29),
        'Prestar atención a lo que sientes es uno de los caminos para que tengas una vida satisfactoria. '
        'Si entablas buena relación con tus emociones, sin juzgarlas cuando aparecen, puedes conseguir '
        'equilibrio y estabilidad.\n\n'
        'Esta es una práctica para que comiences. Escoge un lugar tranquilo para tu práctica formal, '
        'te sitúas en la posición adecuada y pasas revista brevemente a todo el cuerpo.\n\n'
        'Procuras disminuir las tensiones que encuentres, cara, cuello, hombros, columna, vientre…',
        null, 'assets/curso-1-5.mp3',
      ),
      Audicion(0, 5, 6, '6. La Compasión', 'Atención consciente a la compasión.',
        'assets/curso-1-6.png', DateTime(2019, 8, 29),
        'La compasión no es pena. La compasión se sustenta en el aprecio, la amabilidad y en el deseo '
        'de liberar del sufrimiento. La primera persona a la que debes acompañar compasivamente es a ti.\n\n'
        'Esta es una práctica de amabilidad con atención consciente. Tiene elementos de atención al momento '
        'presente y elementos de aceptación y compasión, que significa responder así a nuestra propia experiencia interna.',
        null, 'assets/curso-1-6.mp3',
      ),
      Audicion(0, 6, 7, '7. El espacio y la luz', 'Atención consciente al espacio y la luz.',
        'assets/curso-1-7.png', DateTime(2019, 8, 29),
        'Percibir tu cuerpo es algo tremendamente útil ¿No crees?. Apreciar cómo estás en el espacio, '
        'cómo es tu tono muscular o tu posición. Te invito a ir un poco más allá y comenzar a verte de otra manera. '
        'Eres quien observa.\n\n'
        'Desde el lugar donde te encuentras y la postura que adoptas vas a comenzar la práctica. Respiras ampliamente '
        'y pasas revista al cuerpo brevemente.',
        null, 'assets/curso-1-7.mp3',
      ),
    ],
  ),
  Modulo(1, 'Sueño descanso y salud', 'Dormir es la clave, ya que tu jornada siguietne comienza al acostarte.', 
    'assets/curso-2-1.png', [
      Audicion(1, 0, 8, '1. Introducción', 'La importancia del sueño.',
        'assets/curso-2-1.png', DateTime(2019, 8, 30),
        'Dormir es clave, ya que tu jornada siguiente comienza al acostarte. Un buen día comienza '
        'con un buen sueño de calidad. Si estás haciendo un montón de cosas, pensando en otro montón '
        'más, qué has hecho o dejado de hacer hoy….',
        null, 'assets/curso-2-1.mp3',
      ), 
      Audicion(1, 1, 9, '2. Respiración', 'Respira calma, respira sueño.',
        'assets/curso-2-2.png', DateTime(2019, 8, 29),
        'Dormir bien es parte de un estilo de vida saludable, si no duermes lo suficiente estás '
        'poniendo en juego tu salud. Cualquier persona puede desvelarse de vez en cuando y el cuerpo '
        'ajusta esas deficiencias temporales pero si desarrollas el patrón de dormir poco por noche, '
        'entonces estás abriendo la puerta a problemas de salud.\n\n'
        'Sigue con atención esta unidad para respirar la calma que te lleva al sueño.',
        null, 'assets/curso-2-2.mp3',
      ), 
      Audicion(1, 2, 10, '3. El cuerpo', 'Mecer el cuerpo.',
        'assets/curso-2-3.png', DateTime(2019, 8, 30),
        'Al final de tu jornada, la atención plena puede ser el aliado perfecto para conciliar el sueño. '
        'La privación del sueño es una enfermedad crónica con efectos serios y de gran repercusión en la salud. '
        'Afecta al desempeño, tanto físico como mental, y disminuye la capacidad para resolver problemas.',
        null, 'assets/curso-2-3.mp3',
      ), 
      Audicion(1, 3, 11, '4. Silencio', 'Silencio interior para dormir.',
        'assets/curso-2-4.png', DateTime(2019, 8, 30),
        'El silencio es tu estado natural y no depende del exterior. Mediante la práctica puedes '
        'acceder a ese estado fácilmente. Cierto es, que la invasión permanente de sonidos, como '
        'parte de la excitación del estrés moderno, es tóxica. Aunque sean interesantes las noticias '
        'y atractiva la música que suena en la mayoría de los lugares, el sonido constante debilita, '
        'cansa e impide que la mente respire, se oxigene y funcione adecuadamente.',
        null, 'assets/curso-2-4.mp3',
      ), 
      Audicion(1, 4, 12, '5. Imaginación', 'Imagino mi sueño.',
        'assets/curso-2-5.png', DateTime(2019, 8, 30),
        'El cerebro no distingue entre algo real y algo imaginado, el tuyo tampoco. Por eso puedes '
        'experimentar todas las sensaciones que produce cualquier cosa que aparece en la pantalla de tu mente. '
        'Aprovecha esta capacidad para tu beneficio.',
        null, 'assets/curso-2-5.mp3',
      ), 
      Audicion(1, 5, 13, '6. Movimiento', 'Movimientos sutiles.',
        'assets/curso-2-6.png', DateTime(2019, 8, 30),
        'Es favorable que sigas unas sugerencias previas para un buen sueño. Tu rutina antes de '
        'acostarte es fundamental: oscuridad para segregar melatonina, silencio en la medida de lo posible…',
        null, 'assets/curso-2-6.mp3',
      ), 
      Audicion(1, 6, 14, '7. Pijama', 'Un pijama Ideal.',
        'assets/curso-2-7.png', DateTime(2019, 8, 30),
        'El pijama más fantástico es aquel que te arropa con la temperatura adecuada para incitar tu sueño. '
        'Este último punto es tan importante como los anteriores. Aunque parezca información menor, puedes '
        'añadirlo al comienzo de cualquiera.',
        null, 'assets/curso-2-7.mp3',
      ), 
    ],
  ),
  Modulo(2, 'Atención Plena en familia', 'La falta de atención es una de las causas que más perjudican a los niños y adultos.', 
    'assets/curso-3-1.png', [
      Audicion(2, 0, 15, '1. Introducción', 'La Atención es una Habilidad.',
        'assets/curso-3-1.png', DateTime(2019, 9, 2),
        'La falta de atención se encuentra tanto detrás de los problemas de aprendizaje en las '
        'aulas como en el día a día de adultos, como tú, incapaces de concentrarse en una sola acción o de dormir.',
        null, 'assets/curso-3-1.mp3',
      ), 
      Audicion(2, 1, 16, '2. Distracción', 'Distracciones graciosas o no tanto.',
        'assets/curso-3-2.png', DateTime(2019, 9, 2),
        '¡No estás prestando Atención! ¡Atención, atención!, el coche con matricula 12345, está mal aparcado. '
        'La atención nos afecta a todos: infantes, jóvenes, adultos, sin diferencia de género. A ti también, ¿verdad?.\n\n '
        'Escucha la unidad para continuar.',
        null, 'assets/curso-3-2.mp3',
      ), 
      Audicion(2, 2, 17, '3. Atención', 'Ser Atento o estar Atento. Cierra los ojos.',
        'assets/curso-3-3.png', DateTime(2019, 9, 2),
        'Estar atento es un primer paso para ser atento. Ser atento conlleva actitud y corazón. Implica efectividad y '
        'afectividad; los afectos son la vida.',
        null, 'assets/curso-3-3.mp3',
      ), 
      Audicion(2, 3, 18, '4. Enfoque', 'Enfocando la atención.',
        'assets/curso-3-4.png', DateTime(2019, 9, 2),
        'El enfoque es la atención sostenida, es la capacidad de llevar la atención a algo interno o externo por '
        'voluntad. ¿Cómo está tu voluntad de enfoque?',
        null, 'assets/curso-3-4.mp3',
      ), 
      Audicion(2, 4, 19, '5. Presencia', 'Estar Presente.',
        'assets/curso-3-5.png', DateTime(2019, 9, 2),
        'Estar presente es una cualidad mental. Es darse cuenta de lo que ocurre fuera y dentro de nosotros.\n\n'
        'Puede que estés presente en tu vida o, tal vez está sucediendo mientras estás a otras cosas.',
        null, 'assets/curso-3-5.mp3',
      ), 
      Audicion(2, 5, 20, '6. Enfoque forzoso', 'Forzando el enfoque.',
        'assets/curso-3-6.png', DateTime(2019, 9, 2),
        'Se puede distinguir dentro de la Atención: la atención alerta, la sostenida, la selectiva, la alternante,\n\n'
        'la dividida y la atención focal. En esta unidad puedes descubrir más sobre su utilidad.',
        null, 'assets/curso-3-6.mp3',
      ), 
      Audicion(2, 6, 21, '7. Conexión', 'Conéctate a ti mismo.',
        'assets/curso-3-7.png', DateTime(2019, 9, 2),
        'Práctica la conexión. La atención siempre está ahí, es como el aire, sin embargo respiramos mejor '
        'en unas posturas que en otras. ¿Cómo respiras, tú?, ¿Cuánta Atención eres capaz de prestar?',
        null, 'assets/curso-3-7.mp3',
      ), 
      Audicion(2, 7, 22, '8. Epílogo', 'Consideraciones importantes',
        'assets/curso-3-8.png', DateTime(2019, 9, 2),
        'Actualmente tanto adultos, jóvenes como niños, estamos sometidos a gran cantidad de estímulos a '
        'los que pretendemos atender diariamente. Tienes que decidir, cuánto está afectando la falta de Atención a tu vida.',
        null, 'assets/curso-3-8.mp3',
      ), 
    ],
  ),
];

String biblio = 'Bhante Henepola Gunaratana. El libro del mindfulness (Sabiduría perenne)\n'
  'Calle Ramiro. Meditación para niños. Kairós. \n'
  'Castellón Antonio. El  poder de la educación Mindfulness. Letrame grupo editorial. \n'
  'Comas Sylvia. Burbujas de Paz. \n'
  'Colombian Belén. Mindfulness para familias. Desclée de Brouwer.\n'
  'Emet Joseph. Mindfulness para dormir mejor. \n'
  'García-Campayo Javier, Ausiàs Cebolla, Marcelo M. P. Demarzo. La Ciencia De La Compasión. Más Allá Del Mindfulness. \n'
  'García Campayo J, Demarzo M. Barcelona: Siglantana. Mindfulness y compasión, la nueva revolución. \n'
  'García Campayo J, Demarzo M. Barcelona: Siglantana. Manual práctico de mindfulness: Curiosidad y Aceptación. \n'
  'González Alazne. Mindfulness: guía para educadores. \n'
  'Hanh, T.N. El milagro de mindfulness. Barcelona: Oniro. \n'
  'Hanh, T. N. El poder de la quietud en un mundo ruidoso. Urano.\n'
  'Hanh, T.N. Lograr el milagro de estar atento. Librería Argentina. \n'
  'Jack Kornfield. Después del éxtasis, la colada. \n'
  'Kabat-Zinn, Jon La práctica de la atención plena.  Kairos.\n'
  'Kabat-Zinn, Jon (2013) Mindfulness para principantes.  Kairos. \n'
  'Kabat-Zinn J . Vivir con plenitud la crisis. Barcelona: Kairós. \n'
  'Kabat-Zinn, J. Mindfulness en la vida cotidiana: Donde quiera que vayas, ahí estás. Paidós. \n'
  'Kaiser Greenland Susan. Juegos Mindfulness. Gaia.\n'
  'Kaiser Greenland Susan. El niño Atento. Gaia\n'
  'Littleehales Nick. Dormir. Planeta.\n'
  'López Gonzalez Luis. Mediación para niños. Plataforma Actual.\n'
  'López González Luis. Educar la interioridad. Plataforma Actual \n'
  'Rechtschaffen Daniel J. Educación Mindfulness. Gaia. \n'
  'Sainz Vara de Rey Paloma. Mindfulness para niños. Zenith.\n'
  'Schoebrlein Deborah y Suki Sheth. Mindfulness para enseñar y aprender. Gaia.\n'
  'Shamash Alidina. Vencer el estrés con Mindfulness.  Paídos.\n'
  'Sieguel Ronald. La solución Mindfulness. Desclée de Brouwer. \n'
  'Simón, Vicene. Aprender a practicar Mindfulness. Barcelona: Sello. \n'
  'Simón, Vicente. El corazón del Mindfulness. Vencer al sufrimiento con sabiduría y compasión. Sello\n'
  'Simón, Vicente. Iniciación al mindfulness. Barcelona: Sello. \n'
  'Snel Eline. Tranquilos y atentos como una rana. Kairós.\n'
  'Stahl Bob y Elisha Goldstein. Mindfulness para reducir el estrés. Kairós. ';
