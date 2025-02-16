import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});
  final String markDownContent = """
# Privacy Policy for Try This

**Effective Date:** February 14, 2025

**Last Updated:** February 14, 2025

Welcome to Try This! This Privacy Policy explains how we collect, use, and protect your data when you use our mobile application ("App").

By using Try This, you agree to the terms outlined in this policy. If you do not agree, please refrain from using the App.

## 1. Information We Collect

### A. Data Collected in the MVP Phase

At this stage (MVP phase), Try This does not collect any personal or sensitive user data (such as your name, email, phone number, or location).  We collect user-selected topics or categories of interest, which are stored locally on your device. This data is used to generate personalized activity recommendations using AI.

### B. Data We May Collect in Future Versions

In the future, we may collect the following information to improve personalization and enhance user experience:

*   **Personal Information (Optional):**
    *   Username
    *   Email or Mobile Number (for account creation and login)
*   **Location Data (Not Collected in MVP):**
    *   We may request access to your location *only* to enhance personalized activity recommendations.  Location data will be processed locally on your device and will *never* be shared with any third parties.
*   **User Preferences:**
    *   Topics or categories of interest that you select in the App. This data is used to generate personalized activity recommendations using AI.

## 2. How We Use Your Data

We collect only necessary data to enhance your experience. Here's how we use it:

| Type of Data             | Purpose                                                                                                                                                                  |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| User Preferences (topics) | To provide AI-generated activity recommendations using Google Gemini.                                                                                                    |
| Location Data (future)    | To improve personalized recommendations based on your local environment. This data will *only* be processed locally and *never* shared with third parties. |
| Email / Mobile (future)   | To enable account creation and secure login.                                                                                                                            |

**Important:**

*   We do not sell, rent, or share your personal data with third parties.
*   User-selected preferences (topics) are shared with the Gemini AI model to generate better recommendations.

## 3. Data Storage and Security

We prioritize your privacy and take measures to protect your data:

*   Currently, Try This does not store any personal data. User preferences are stored locally on the device.
*   If we introduce user accounts in the future, your data will be securely stored using encryption and industry-standard security practices.  [Specify more details about encryption and standards here.]
*   Location data (if collected in the future) will be used only for personalization and not stored permanently.

## 4. Third-Party Services

We use Google's Gemini AI to generate activity recommendations based on your selected preferences.

No personally identifiable data (name, email, location) is shared with Gemini AI. Only user-selected topics are passed to the AI model for recommendation generation.

## 5. Your Rights

As a user based in India, you have the following rights regarding your data:

*   **Right to Access:** You can request to see the data we have about you (if any).
*   **Right to Modify:** You can update your preferences anytime.
*   **Right to Delete:** If account creation is implemented in the future, you can request account deletion.

Currently, as we do not store personal data, no additional action is required.

## 6. Changes to This Privacy Policy

We may update this Privacy Policy from time to time to reflect new features or legal requirements. You will be notified in the App if any major changes occur. The latest version will always be available in the App settings.

## 7. Contact Us

For any questions regarding this Privacy Policy, you can reach us at:

Email: vishwaprasad11@gmail.com""";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
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
