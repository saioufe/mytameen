import 'package:flutter/widgets.dart';
import 'package:my_tameen/models/questions.dart';
import 'package:my_tameen/providers/languages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImportantQuestions extends ChangeNotifier {
  List<int> langClicked = [1, 0];

  List<Questions> _questions = [
    Questions(
      question: "في حالة وقوع الحادث ماذا يجب عليك فعله",
      answer:
          "1 – ابلاغ الشرطة بأسرع وقت ممكن 112. \n  2 – لا تغادر مكان الحادث دون اخذ اذن من الشرطة. \n  3 – لا تترك الطرف الأخر (داعم أو مدعوم) يذهب دون أخذ رقم اللوحة. \n  4 – قم بتصوير الحادث والأضرار بهاتفك النقال. \n  5 – ابلاغ شركة التأمين عن طريق حضور المشترك وفتح ملف حادث والتأكد من احضار الاتي: \n أ / اخطار الحادث – تقرير المخفر. \n ب / دفتر المركبة.\n ج / البطاقة المدنية لصاحب المركبة. \n د / رخصة سائق المركبة أثناء الحادث.",
    ),
    Questions(
      question:
          "في حالة استلامك لوثيقة التأمين هل يمكنك الغاء الوثيقة واسترداد القيمة المدفوعة",
      answer:
          "يرجى العلم بأنه في حالة الغاء الوثيقة بعد استلامها فان الالغاء يكون خاضع لسياسة وشروط وأحكام الشركة المؤمنة حيث انه في بعض الحالات فقط يمكن للعميل الغاء الوثيقة واسترداد جزئي او كلي من قيمة التأمين لذا يرجى مراجعة الشروط والاحكام جيدا لدى الشركة التي ترغب بعمل التأمين لديها ولا يحق لك مطالبة موقع وتطبيق ماي تأمين بأي تعويض بهذا الخصوص",
    ),
    Questions(
      question:
          "متى يكون وقت وتاريخ بداية الوثيقة عند طلب وثيقة التأمين من خلال موقع وتطبيق ماي تأمين",
      answer:
          "عند طلب الوثيقة من خلالنا يجب عليك وضع التاريخ المحدد من قبلك بموعد بداية الوثيقة وعندها سنقوم بمتابعة طلبك فورا مع شركة التأمين المختارة من قبلكم وسيتم ابلاغكم بموعد اعتماد الطب واصدار الوثيقة.",
    ),
    Questions(
      question:
          "هل يكون التأمين ساري فورا عند طلب وثيقة التأمين من خلال موقع وتطبيق ماي تأمين",
      answer:
          "لا يكون التامين ساري الا بعد استيفاء جميع الشروط والاحكام الخاضعة لسياسة التطبيق وشركات التامين، كما يرجى العلم بأنه سوف يتم ارسال رسالة تأكيد من قبلنا تفيدكم بتفعيل الوثيقة فورا اصدارها أو عند استلامكم للوثيقة وسداد كافة المستحقات المطالبين بها عندها فقط يمكنك الاستفادة من التأمين.",
    ),
    Questions(
      question: "هل يوجد وقت ملزم للعميل بموعد استلام وثيقة التأمين",
      answer:
          "لا يوجد وقت ملزم لاستلام وثيقة التأمين من قبل العميل، حيث انه بمجرد اصدار الوثيقة واستيفاء العميل لجميع الشروط والاحكام ومعاينة المركبة وسداد كافة المستحقات المطالب بها لإصدار الوثيقة فانه يكون خاضع للتغطية التأمينية ولا يشترط استلام العميل للوثيقة ويحق له المطالبة بالوثيقة باي وقت ومتى شاء.",
    ),
    Questions(
      question: "عن فقدانك لوثيقة التأمين الخاصة بك ماذا افعل",
      answer:
          "في حالة فقدان وثيقة التأمين يمكنك التواصل مع شركة التامين وتزويدهم بالبيانات المطلوبة (اسم العميل - نوع السيارة – رقم اللوحة الخ...) وسنقوم الشركة بإصدار بدل فاقد اما فيما يخص رسوم اصدار بدل فاقد فان الرسوم تخضع لسياسة وشروط واحكام شركات التأمين كما يرجى العلم بأنه في حالة فقدان الوثيقة فان التأمين يكون ساري ولا يسقط بفقدان الوثيقة.",
    ),
    Questions(
      question: "هل يمكن استلام الوثيقة من قبل شخص اخر",
      answer:
          "نعم يمكن تسليم الوثيقة لاي شخص اخر بناء على طلبكم مع الاحتفاظ بحق الشركة بالرفض متى شاءت. ",
    ),
    Questions(
      question: "هل يشترط تصوير ومعاينة المركبة من قبل الشركة المؤمنة",
      answer:
          "هذا الشرط يخضع لسياسة وشروط واحكام الشركة المؤمنة كما ان معظم المركبات الحديثة لا يشترط بها المعاينة والتصوير من قبل الشركة ولكن لا يمكن إلزام الشركة بعدم المعاينة والتصوير وهذا يكون أفضل لكلا الطرفين ",
    ),
    Questions(
      question:
          "ما هوا المقصود (بعدم حق الرجوع) الموجود بالملحقات الخاصة في وثيقة تأمين السيارات: (مهم جدا)",
      answer:
          "عند مخالفة سائق المركبة للقوانين الجسيمة داخل الكويت ونشوب حادث بناء على هذه المخالفة يحق لشركة التأمين في هذه الحالة ان تقوم بالرجوع عليك ولها الحق بعدم تصليح وتغطية الضرر الناجم عن هذه المخالفة،  لكن عن اضافتك لبند عدم حق الرجوع فإنك بذألك تقوم بإلغاء هذا الشرط الممنوح لشركة التأمين وستقوم الشركة بتحمل الضرر الناتج عن هذه المخالفة والمقصود بالمخالفات الجسيمة هي ان يقوم السائق بتجاوز الاشارة الضوئية الحمراء أو السير عكس الاتجاه أو القيادة بسرعة تتجاوز الحد المسموح به من قبل الادارة العامة للمرور داخل دولة الكويت.",
    ),
    Questions(
      question: "في حالة الهلاك الكلي للمركبة",
      answer:
          "الهلاك الكلي للمركبة يخضع لسياسة وشروط واحكام الشركة المؤمنة ويكون التعويض بناء على الشروط المتفق عليها بين العميل والشركة في عقد التأمين ويختلف من شركة لأخرى لكن يجب على العميل معرفة الاتي\n  1 / عند قيام العميل بكتابة واختيار القيمة التأمينية للمركبة الذي يرغب هوا بتأمينه اقل من القيمة السوقية لها في السوق وقت وقوع الحادث فانه في هذه الحالة يكون التعويض على القيمة المدخلة والمختارة من قبل العميل (أيهما أقل).\n  2 / عند قيام العميل بكتابة واختيار القيمة التأمينية للمركبة الذي يرغب هوا بتأمينه أعلى من القيمة السوقية لها في السوق وقت وقوع الحادث فانه في هذه الحالة يكون التعويض على القيمة السوقية للمركبة (أيهما أقل).",
    ),
    Questions(
      question: "نقل ملكية المركبة من شخص الى اخر",
      answer:
          "في حالة تحويل المركبة من شخص الى اخر يجب على الشخص المؤمن ان يقوم بإبلاغ الشركة ومراجعتها خلال اسبوع واحد فقط والا تصبح الشركة غير مسئولة عن اية اضرار تصيب المركبة بعد التحويل وتعتبر الوثيقة لاغية.",
    ),
  ];

  List<Questions> _questions2 = [
    Questions(
      question: "In case of an accident, what should you do?",
      answer:
          "1 - Inform the police as soon as possible 112. \n   2 - Do not leave the accident spot without take A permission from police. \n   3 - Do not let the other party leave without taking motor plate number. \n   4 - capture the accident and damage by your cell phone. \n   5 - Inform the insurance company through the presence of the participant and open an accident file and make sure to bring the following:  \n A / Accident Notification - Outpost Report. \n B / Vehicle book. \n C / Civil ID of the vehicle owner. \n D / The driver's license during the accident. ",
    ),
    Questions(
        question:
            "If you receive the insurance policy, can you cancel the insurance and get a refund?",
        answer:
            "Please note that in case of cancellation of the Insurance after receipt, the cancellation is subject to the policy and terms and conditions of the insured company, as in some cases only the customer can cancel the Insurance and partial or full refund of the value of the insurance, so please review the terms and conditions well with the company you wish to make insurance  You don’t claim the site and the application Mytamen Insurance for any compensation in this regard."),
    Questions(
        question:
            "When is the time and date of the start of the policy when requesting the insurance policy through the website and application of Mytamen:",
        answer:
            "When requesting the policy through us you must set the date specified by you at the beginning of the Insurance and then we will follow up your application immediately with the insurance company selected by you and you will be informed of the date of approval  and the issuance of the document."),
    Questions(
        question:
            "Is the insurance valid immediately upon requesting the insurance policy through the website and application of mytamen Insurance:",
        answer:
            " Insurance is valid only after fulfilling all the terms and conditions subject to the policy of the application and the insurance companies.Please be advised that we will  sent a confirmation letter from us informing your document has been valid  issued or upon receipt of the document and payment of all dues claimed only then you can benefit from insurance."),
    Questions(
        question:
            " Is there a binding time for the customer to receive the insurance policy?",
        answer:
            " There is no binding time for the receipt of the insurance policy by the customer, as once the policy is issued and the customer meets all the terms and conditions, inspects the vehicle and pays all the dues claimed for the issuance of the policy, it is subject to insurance coverage.It is not required that the customer receives the policy and is entitled to claim the policy at any time and whenever he wishes."),
    Questions(
        question: "If you have lost your insurance policy, what should you do?",
        answer:
            " In case of loss of the insurance policy, you can contact the insurance company and provide them with the required data (customer name - car type - plate number etc ...) Then they will issue a replacement for lost. As for the fees for issuing a replacement, the fees are subject to the policy and terms and conditions of insurance companies as advised If the policy is lost, the insurance will be valid and will not be forfeited"),
    Questions(
      question: "Is it possible to receive the document by another person?",
      answer:
          " Yes, the document can be delivered to any other person at your request and the company reserves the right to refuse at any time.",
    ),
    Questions(
        question:
            "Is it necessary to photograph and inspect the vehicle by the insured company?",
        answer:
            " This condition is subject to the policy and terms and conditions of the insured company as most modern vehicles are not required by the inspection and imaging by the company, but can not oblige the company not to preview and imaging and this is better for both parties"),
    Questions(
        question:
            "What is meant by (no right of recourse) found in the special accessories in the car insurance policy: (very important)",
        answer:
            " When the driver of the vehicle violates the serious laws inside Kuwait and an accident occurs according to this violation, the insurance company has the right to refer you and has the right not to repair and cover the damage caused by this violation. However, by adding no right of recourse then this condition given will be cancel and the insurance company will bear the damage resulting from this violation. Plus, the driver to cross the red traffic light, drive in the opposite direction or drive at a speed exceeding the limit allowed by the General Directorate of Traffic inside Kuwait and have an accident also will be cover."),
    Questions(
      question: "In case of total destruction of the vehicle?",
      answer:
          " 1 / When the customer writes and selects the insurance value of the vehicle that He/she wishes to insure less than the market value of it in the market at the time of the accident, in this case the compensation will be on the value entered and selected by the customer (whichever is less). \n   2 / When the customer writes and selects the insurance value of the vehicle that he / she wishes to insure is higher than the market value of it in the market at the time of the accident, in this case the compensation is on the market value of the vehicle (whichever is lower).",
    ),
    Questions(
        question:
            "Transfer of ownership of the vehicle from one person to another",
        answer:
            " In case of transferring the vehicle from one person to another, the insured person should notify the company and revise it within one week only. "),
  ];

  List<Questions> get questions {
    return _questions;
  }

  List<Questions> get questions2 {
    return _questions2;
  }
}
