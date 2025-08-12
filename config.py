"""
Configuration file for AI ATS Resume Rater
Modify these settings to customize the application behavior
"""

# Application Settings
APP_CONFIG = {
    "title": "AI ATS Resume Rater",
    "description": "Get instant feedback on your resume's ATS compatibility and improve your chances of landing interviews!",
    "version": "1.0.0",
    "author": "John Vianney Jandayan",
    "port": 7860,
    "host": "0.0.0.0",
    "share": True,
    "debug": False
}

# File Upload Settings
UPLOAD_CONFIG = {
    "max_file_size_mb": 10,
    "allowed_extensions": [".pdf", ".docx", ".txt"],
    "max_text_length": 50000  # Maximum characters in extracted text
}

# AI Model Settings
MODEL_CONFIG = {
    "sentiment_model": "cardiffnlp/twitter-roberta-base-sentiment-latest",
    "classification_model": "facebook/bart-large-mnli",
    "max_chunk_size": 512,  # For text analysis
    "max_chunks": 3  # Limit chunks to avoid API rate limits
}

# Scoring Weights (must sum to 1.0)
SCORING_WEIGHTS = {
    "technical_skills": 0.25,
    "soft_skills": 0.15,
    "education": 0.15,
    "experience": 0.25,
    "structure": 0.15,
    "sentiment": 0.05
}

# Keyword Lists
TECHNICAL_SKILLS = [
    # Programming Languages
    'python', 'java', 'javascript', 'typescript', 'c++', 'c#', 'php', 'ruby', 'go', 'rust',
    'swift', 'kotlin', 'scala', 'r', 'matlab', 'sql', 'html', 'css', 'sass', 'less',
    
    # Frameworks & Libraries
    'react', 'angular', 'vue', 'nodejs', 'express', 'django', 'flask', 'fastapi', 'spring',
    'spring boot', 'laravel', 'rails', 'asp.net', '.net', 'jquery', 'bootstrap', 'tailwind',
    
    # Databases
    'mysql', 'postgresql', 'mongodb', 'redis', 'sqlite', 'oracle', 'cassandra', 'elasticsearch',
    'dynamodb', 'neo4j', 'influxdb', 'bigquery',
    
    # Cloud & DevOps
    'aws', 'azure', 'gcp', 'google cloud', 'docker', 'kubernetes', 'jenkins', 'gitlab ci',
    'github actions', 'terraform', 'ansible', 'nginx', 'apache', 'linux', 'ubuntu',
    
    # Development Tools
    'git', 'github', 'gitlab', 'bitbucket', 'jira', 'confluence', 'slack', 'vscode',
    'intellij', 'eclipse', 'postman', 'swagger', 'figma', 'sketch',
    
    # Methodologies & Concepts
    'agile', 'scrum', 'kanban', 'devops', 'ci/cd', 'tdd', 'bdd', 'microservices',
    'rest api', 'graphql', 'websocket', 'oauth', 'jwt', 'soap', 'xml', 'json',
    
    # AI/ML & Data Science
    'machine learning', 'deep learning', 'ai', 'artificial intelligence', 'tensorflow',
    'pytorch', 'scikit-learn', 'pandas', 'numpy', 'matplotlib', 'seaborn', 'jupyter',
    'data science', 'data analysis', 'statistics', 'nlp', 'computer vision', 'opencv'
]

SOFT_SKILLS = [
    # Leadership & Management
    'leadership', 'team lead', 'management', 'project management', 'people management',
    'mentoring', 'coaching', 'delegation', 'strategic planning', 'decision making',
    
    # Communication
    'communication', 'presentation', 'public speaking', 'writing', 'documentation',
    'technical writing', 'stakeholder management', 'client relations', 'negotiation',
    
    # Collaboration
    'teamwork', 'collaboration', 'cross-functional', 'interpersonal', 'networking',
    'relationship building', 'conflict resolution', 'consensus building',
    
    # Problem Solving
    'problem solving', 'analytical', 'critical thinking', 'troubleshooting', 'debugging',
    'root cause analysis', 'innovation', 'creative thinking', 'research',
    
    # Personal Qualities
    'adaptable', 'flexible', 'detail-oriented', 'organized', 'time management',
    'multitasking', 'self-motivated', 'proactive', 'reliable', 'accountable',
    'results-driven', 'goal-oriented', 'customer-focused', 'quality-focused'
]

EDUCATION_KEYWORDS = [
    # Degrees
    'bachelor', 'master', 'phd', 'doctorate', 'associate', 'diploma', 'degree',
    'bs', 'ba', 'ms', 'ma', 'mba', 'phd', 'md', 'jd',
    
    # Institutions
    'university', 'college', 'institute', 'school', 'academy', 'polytechnic',
    
    # Certifications
    'certification', 'certified', 'certificate', 'license', 'accredited',
    'professional', 'expert', 'specialist', 'associate',
    
    # Training
    'training', 'course', 'coursework', 'bootcamp', 'workshop', 'seminar',
    'conference', 'continuing education', 'professional development'
]

EXPERIENCE_KEYWORDS = [
    # Action Verbs
    'developed', 'created', 'built', 'designed', 'implemented', 'deployed',
    'managed', 'led', 'directed', 'supervised', 'coordinated', 'organized',
    'achieved', 'accomplished', 'delivered', 'completed', 'executed',
    'improved', 'optimized', 'enhanced', 'increased', 'reduced', 'decreased',
    'analyzed', 'researched', 'investigated', 'evaluated', 'assessed',
    'collaborated', 'worked', 'partnered', 'contributed', 'participated',
    
    # Experience Indicators
    'experience', 'years', 'responsible for', 'accountable for', 'in charge of',
    'oversaw', 'maintained', 'supported', 'assisted', 'helped', 'worked on',
    'involved in', 'participated in', 'contributed to'
]

# Scoring Thresholds
SCORE_THRESHOLDS = {
    "excellent": 85,
    "good": 70,
    "fair": 55,
    "poor": 0
}

# UI Configuration
UI_CONFIG = {
    "theme": "soft",  # Gradio theme
    "primary_color": "#667eea",
    "secondary_color": "#764ba2",
    "max_width": "1200px",
    "enable_queue": True,
    "show_error": True
}

# Analytics (Optional)
ANALYTICS_CONFIG = {
    "enable_analytics": False,
    "google_analytics_id": None,
    "track_file_uploads": False,
    "track_analysis_results": False
}
