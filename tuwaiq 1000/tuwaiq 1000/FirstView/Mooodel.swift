//
//  Data.swift
//  amazon
//
//  Created by Macbook on 11/03/1443 AH.
//

import UIKit



struct Iitem {
    let namee : String
    let date : String
    let imageee : UIImage?
    let summmmer : String
    let webnews : String
}

var qaz : Array<Iitem> = []
var wsx : Array<Iitem> = []
var edc : Array<Iitem> = []
var eee : Array<Iitem> = []
//var ccc : Array<Iitem> = []

var Liist : Array<Iitem> = [
    Iitem(
        namee: "شروط التقديم على معسكر طويق 1000",
        date : "699",
        imageee: UIImage(named: "ad1"),
        summmmer : "أن يكون المتقدم للمعسكر سعودي أو سعودية الجنسية،يمتلك شغف واهتمام في أي من المسارات التقنية في البرنامج، لديه دوافع حقيقية ومقنعة للانضمام يمتلك مهارات متميزة وممتازة في العمل الجماعي مع الآخرين، ألا يقل عمر المتقدم عن 18 عامًا،الإجادة التامة من قِبل المتقدم للغة الإنجليزية،إجتياز المقابلة الشخصية للمتقدم، التفرغ التام للمتقدم لمدة لا تقل عن 4 أشهر، يتكفل المشارك بتسديد كافة نفقات البرنامج في حالة الإنسحاب أو الغياب الغير مبرر",
        webnews : "https://google.com"
    ),
Iitem(
    namee: "apple airpods pro",
    date : "899",
    imageee: UIImage(named: "ad2"),
    summmmer : "",
    webnews : "https://www.google.com/search?q=tuwaiq+1000&sxsrf=AOaemvLiBJ7ymJ0rj31GIe_dil7nnQaYMQ:1641723996565&source=lnms&tbm=isch&sa=X&sqi=2&ved=2ahUKEwiylYm9uqT1AhUIHM0KHW4pAuEQ_AUoAnoECAEQBA&biw=1440&bih=821&dpr=1#imgrc=S2PI8GSf-IAejM"
),
Iitem(
    namee: "",
    date : "3999",
    imageee: UIImage(named: "ad3"),
    summmmer : "نظام كاميرا مزدوجة 12MP (كاميرا واسعة للغاية وكاميرا واسعة) مع نمط بورتريه‏، ونمط الليل، وDeep Fusion‏، وميزة ‏HDR 3 الذكية وتسجيل فيديو HDR مع Dolby Vision لغاية 4K بمعدل 30 إطاراً في,الثانية، وفيديو 4K لغاية 60 إطاراً في الثانية بنطاق ديناميكي أوسع",
    webnews : "https://google.com"
),
Iitem(
    namee: "apple watch",
    date : "1499",
    imageee: UIImage(named: "ad4"),
    summmmer : "شاشة Retina لا تنطفئ أكبر من شاشة Series 6 بنسبة 20% تقريباً، ما يتيح لك المزيد من السهولة في الرؤية والاستخدام",
    webnews : "https://google.com"

),
Iitem(
    namee: "console PS5",
    date : "250",
    imageee: UIImage(named: "ad5"),
    summmmer : "اكتشف تجربة لعب أعمق وغامرة للغاية مع وحدة تحكم PlayStation 5 المبتكرة الجديدة والتي تتميز باستجابة لمسية وتأثيرات تحفيز ديناميكية تتضمن وحدة التحكم دوال سينس اللاسلكية ميكروفون مدمج وزر إنشائي، وجميعها مدمجة في تصميم أيقوني ومريح.",
    webnews : "https://google.com"

),
Iitem(
    namee: "PS5",
    date : "2999",
    imageee: UIImage(named: "ad6"),
    
    summmmer : "استمتع بتجربة تحميل بسرعة البرق مع وسيط تخزين ذو حالة ثابتة فائق السرعة، وانغماس أعمق مع دعمٍ لردود الفعل اللمسية، وأزرار متكيفة وصوت ثلاثي الأبعاد، وجيل جديد تمامًا من ألعاب PlayStation المذهلة",
    webnews : "https://google.com"

),
Iitem(
    namee: "coffe maker",
    date : "500",
    imageee: UIImage(named: "15"),
    summmmer : "ديلونجي EC9 الة لصنع القهوة كما لو ان تم صنعها في المقهى. ابعاد هذه الالة تصل الى 24.0 * 26.0 * 29.0سم ويمكن وضعها في مطبخ ضيق. وهي تزن فقط 2.5 كغم مما يسهل عملية نقلها من مكان لاخر. الة صنع القهوة هذه تتميز بنظام فاريو الذي يوفرلك امكانية اختيار من النكهة الغنية الى الخفيفية. وهذه الميزة توفر لك السيطرة بالكامل على طعم المشروب الخاص بك اذ تتيح لك صنع القهوة بالطريقة التي ترغبها.",
    webnews : "https://google.com"

),
Iitem(
    namee: "coffe maker",
    date : "400",
    imageee: UIImage(named: "16"),
    summmmer : "سعة خزان المياه: 0.8 لتر، وزن الماكينة: 2.5 كغم، القوة الكهربائية للآلة: 1500 واط، ستستمتع بقهوةٍ مصنوعة باحتراف بالكريما المخملية الكثيفة، مع نظام الضغط الذي يقدر بنحو 15 بار لماكينة القهوة ميني مي. يتم الحفاظ على جودة القهوة باستخدام كبسولات محكمة الإغلاق للاستمتاع بمذاق غني ورائحة فواحة. اختر ما تريد تناوله من مشروبات القهوة الـ 16: إذ يمكنك التمتع بمجموعةٍ واسعة من الاسبريسو والكابتشينو بالرغوة الناعمة أو قهوة غراندي ذات الرائحة الأخاذة وحتى مشروب الشوكولاتة الساخنة ونكهات الشاي المتنوعة وأكثر من ذلك تحضّر ماكينة تحضير القهوة ميني مي المشروبات الساخنة بالإضافة إلى المشروبات الباردة اللذيذة باستخدام الكبسولات. يقوم وضع الشحن الاقتصادي بإيقاف تشغيل الجهاز تلقائيًا بعد 5 دقائق من عدم الاستخدام. يملك الجهاز تصنيف ايه في مجال استهلاك الطاقة.",
    webnews : "https://google.com"

),
]


