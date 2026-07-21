import 'package:flutter/material.dart';

import 'first_aid_guidance_page.dart';

class FirstAidTopic {
  const FirstAidTopic({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.immediateSteps,
    required this.warningSigns,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final List<String> immediateSteps;
  final List<String> warningSigns;
}

class FirstAidPage extends StatelessWidget {
  const FirstAidPage({super.key});

  @override
  Widget build(BuildContext context) {
    final firstAidTopics = [
      FirstAidTopic(
        icon: Icons.healing_outlined,
        title: 'Wounds and Bleeding',
        subtitle: 'Basic immediate care for minor wounds and bleeding.',
        immediateSteps: [
          'Keep the animal calm and prevent further movement if possible.',
          'Use a clean cloth or sterile dressing to apply gentle direct pressure to external bleeding.',
          'Avoid repeatedly removing the dressing to check the wound.',
        ],
        warningSigns: [
          'Bleeding is heavy or does not slow with gentle pressure.',
          'The animal is weak, collapsed, or unusually unresponsive.',
          'The wound is deep, extensive, or caused by a serious accident.',
        ],
      ),
      FirstAidTopic(
        icon: Icons.local_fire_department_outlined,
        title: 'Burns',
        subtitle: 'Immediate supportive steps for burn injuries.',
        immediateSteps: [
          'Move the animal away from the source of heat or danger.',
          'Keep the animal calm and prevent further exposure.',
          'Seek veterinary advice as soon as possible because burns can be more serious than they appear.',
        ],
        warningSigns: [
          'The burn is extensive or affects a large area.',
          'The animal appears severely distressed or weak.',
          'The face, eyes, mouth, or breathing are affected.',
        ],
      ),
      FirstAidTopic(
        icon: Icons.wb_sunny_outlined,
        title: 'Heat-Related Emergency',
        subtitle: 'Recognize signs of heat stress and seek urgent help.',
        immediateSteps: [
          'Move the animal to a cool, shaded, and well-ventilated area.',
          'Allow access to small amounts of drinking water if the animal is alert and able to drink.',
          'Contact a veterinarian urgently if the animal is showing serious signs of overheating.',
        ],
        warningSigns: [
          'Difficulty breathing or severe panting.',
          'Weakness, collapse, confusion, or unusual unresponsiveness.',
          'The animal is rapidly getting worse.',
        ],
      ),
      FirstAidTopic(
        icon: Icons.accessibility_new_outlined,
        title: 'Injuries and Suspected Fractures',
        subtitle: 'Keep an injured animal safe while seeking professional help.',
        immediateSteps: [
          'Keep the animal as still and calm as possible.',
          'Avoid trying to straighten or manipulate an injured limb.',
          'Contact a veterinarian for professional assessment.',
        ],
        warningSigns: [
          'The animal cannot stand or walk normally.',
          'There is severe pain or significant swelling.',
          'The injury followed a major accident or trauma.',
        ],
      ),
      FirstAidTopic(
        icon: Icons.warning_amber_outlined,
        title: 'Possible Poisoning',
        subtitle: 'Seek professional guidance quickly if harmful exposure is suspected.',
        immediateSteps: [
          'Move the animal away from the suspected harmful substance.',
          'Keep the product packaging or information available for the veterinarian if possible.',
          'Contact a veterinarian or animal poison emergency service immediately for guidance.',
        ],
        warningSigns: [
          'Vomiting, severe weakness, tremors, or unusual behavior.',
          'Difficulty breathing or collapse.',
          'The animal may have consumed a potentially dangerous substance.',
        ],
      ),
      FirstAidTopic(
        icon: Icons.visibility_outlined,
        title: 'Eye Injuries',
        subtitle: 'Protect the eye and seek professional veterinary assessment.',
        immediateSteps: [
          'Prevent the animal from rubbing or scratching the affected eye if possible.',
          'Keep the animal calm.',
          'Contact a veterinarian for proper assessment, especially if the injury appears serious.',
        ],
        warningSigns: [
          'The eye is severely swollen or cannot be opened.',
          'There is significant pain or sudden vision-related concern.',
          'The injury followed trauma or a foreign object entering the eye.',
        ],
      ),
      FirstAidTopic(
        icon: Icons.air_outlined,
        title: 'Choking',
        subtitle: 'Treat suspected breathing emergencies as urgent.',
        immediateSteps: [
          'Keep the animal as calm as possible.',
          'Seek urgent veterinary or emergency animal-care assistance.',
          'Do not delay professional help if the animal is struggling to breathe.',
        ],
        warningSigns: [
          'Difficulty breathing.',
          'Blue or pale-looking gums or tongue.',
          'Collapse or rapidly worsening condition.',
        ],
      ),
      FirstAidTopic(
        icon: Icons.health_and_safety_outlined,
        title: 'Seizure Response',
        subtitle: 'Keep the animal safe and seek veterinary guidance.',
        immediateSteps: [
          'Move nearby objects away to reduce the risk of injury.',
          'Keep the surroundings calm and avoid restraining the animal.',
          'Contact a veterinarian for guidance, especially if the event is prolonged or repeated.',
        ],
        warningSigns: [
          'The episode is prolonged or repeated.',
          'The animal does not recover normally afterward.',
          'The animal has difficulty breathing or is seriously injured.',
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal First Aid'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.health_and_safety_outlined,
                    size: 42,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Quick First Aid Guidance',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Choose a situation to learn about immediate supportive steps and when professional veterinary care may be needed.',
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'This guidance does not replace professional veterinary care.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Choose a Situation',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 12),
          ...firstAidTopics.map(
            (topic) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    child: Icon(topic.icon),
                  ),
                  title: Text(
                    topic.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(topic.subtitle),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FirstAidGuidancePage(
                          title: topic.title,
                          icon: topic.icon,
                          immediateSteps: topic.immediateSteps,
                          warningSigns: topic.warningSigns,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}