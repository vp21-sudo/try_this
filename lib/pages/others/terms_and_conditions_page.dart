import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});
  final String markDownContent = """
  **Terms and Conditions for Try This**

**Effective Date:** 14 Feb 2025

**Last Updated:** 14 Feb 2025

**1. Introduction**

Welcome to Try This (the "App"), a mobile application provided by Vishwa Prasad L("we," "us," or "our"). These Terms and Conditions ("Terms") govern your access to and use of the App, including all content, features, and services offered through it. By downloading, installing, or using the App, you agree to be bound by these Terms. If you do not agree with these Terms, please do not use the App.

**2. User Accounts**

*   You may be required to create an account to access certain features of the App. You are responsible for maintaining the confidentiality of your account credentials and for all activities that occur under your account.
*   You must provide accurate and complete information when creating your account.
*   You must be at least 18 years old to use the App.
*   We reserve the right to suspend or terminate your account at any time for any reason, including but not limited to, violation of these Terms.

**3. Personalized Activities**

*   The App provides personalized activity suggestions based on the preferences you select. While we strive to provide relevant and enjoyable activities, we do not guarantee the accuracy, suitability, or availability of any suggested activities.
*   You are solely responsible for evaluating the risks associated with participating in any suggested activity. We are not liable for any injuries, damages, or losses that may occur as a result of your participation in activities suggested by the App.
*   The activity suggestions provided by the App are for informational purposes only and do not constitute professional advice. You should consult with qualified professionals before engaging in any activity that requires specialized knowledge or training.

**4. User Content**

*   You may be able to submit or upload content to the App, such as reviews, ratings, or comments ("User Content").
*   You are solely responsible for your User Content. You represent and warrant that you have all necessary rights to your User Content and that your User Content does not infringe upon the rights of any third party.
*   By submitting User Content, you grant us a non-exclusive, royalty-free, worldwide, perpetual license to use, reproduce, modify, and distribute your User Content in connection with the App.
*   We reserve the right to remove or modify any User Content that we deem to be inappropriate, offensive, or violates these Terms.

**5. Intellectual Property**

*   The App and all content included in it, including but not limited to text, graphics, logos, and software, are the property of Vishwa Prasad L and are protected by copyright and other intellectual property laws.
*   You may not reproduce, modify, distribute, or display any content from the App without our prior written consent.

**6. Disclaimer of Warranties**

*   The App is provided "as is" and "as available" without any warranties of any kind, either express or implied.
*   We do not warrant that the App will be uninterrupted, error-free, or that any defects will be corrected.
*   We do not warrant the accuracy, completeness, or reliability of any content or information provided through the App.

**7. Limitation of Liability**

*   To the fullest extent permitted by law, we will not be liable for any indirect, incidental, special, consequential, or punitive damages arising out of or related to your use of the App.
*   Our total liability to you for any claim arising out of or related to these Terms or the App will not exceed the amount you paid us, if any, to use the App.

**8. Governing Law**

These Terms will be governed by and construed in accordance with the laws of India, without regard to its conflict of law principles.

**9. Changes to these Terms**

We reserve the right to modify these Terms at any time. We will notify you of any changes by posting the updated Terms on the App. Your continued use of the App after the posting of the updated Terms constitutes your acceptance of the changes.

**10. Contact Us**

If you have any questions about these Terms, please contact us at:

vishwaprasad11@gmail.com

**11. Entire Agreement**

These Terms constitute the entire agreement between you and us regarding the App and supersede all prior agreements and understandings.

**12. Severability**

If any provision of these Terms is held to be invalid or unenforceable, the remaining provisions will remain in full force and effect.
 """;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Markdown(
          data: markDownContent,
          styleSheet: MarkdownStyleSheet(
            h1: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            h2: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            p: const TextStyle(fontSize: 16),
            listBullet:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
