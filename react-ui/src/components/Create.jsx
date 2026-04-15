import React, { useState } from 'react';
import axios from 'axios';
import { useNavigate } from 'react-router-dom';

// Same skill set as original
const skillSet = [
  { name: 'Javascript' },
  { name: 'Java' },
  { name: 'Python' },
  { name: 'Django' },
  { name: 'Rust' },
];

const CheckIcon = () => (
  <svg width="10" height="10" viewBox="0 0 24 24" fill="none" stroke="white" strokeWidth="3.5" strokeLinecap="round" strokeLinejoin="round">
    <polyline points="20 6 9 17 4 12"/>
  </svg>
);

const Create = () => {
  const [postId, setPostId]             = useState('');
  const [postProfile, setPostProfile]   = useState('');
  const [postDesc, setPostDesc]         = useState('');
  const [reqExperience, setReqExperience] = useState('');
  const [postTechStack, setPostTechStack] = useState([]);
  const [loading, setLoading]           = useState(false);
  const [toast, setToast]               = useState(null);

  const navigate = useNavigate();

  // ── same logic as original ──
  const handleSkillChange = (skillName) => {
    setPostTechStack((prev) =>
      prev.includes(skillName)
        ? prev.filter((s) => s !== skillName)
        : [...prev, skillName]
    );
  };

  const showToast = (type, message) => {
    setToast({ type, message });
    setTimeout(() => setToast(null), 3000);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    try {
      await axios.post('http://localhost:8080/jobPost', {
        postId,
        postProfile,
        postDesc,
        reqExperience,
        postTechStack,
      });
      showToast('success', 'Job posted successfully!');
      setTimeout(() => navigate('/'), 1500);
    } catch (err) {
      console.error(err);
      showToast('error', 'Failed to post job. Check your connection.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="form-page">
      <div className="form-container">
        <div className="form-card">

          {/* Header */}
          <div className="form-header">
            <span className="form-badge">
              <svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
                <line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/>
              </svg>
              New Job
            </span>
            <h1 className="form-title">Post a Job Opening</h1>
            <p className="form-subtitle">Fill in the details below to publish your listing</p>
          </div>

          {/* Form */}
          <form onSubmit={handleSubmit} noValidate>

            <div className="form-row">
              {/* Post ID */}
              <div className="form-group">
                <label htmlFor="postId" className="form-label">Job ID</label>
                <input
                  id="postId"
                  type="number"
                  className="form-input"
                  placeholder="e.g. 101"
                  value={postId}
                  onChange={(e) => setPostId(e.target.value)}
                  required
                />
              </div>

              {/* Experience */}
              <div className="form-group">
                <label htmlFor="reqExperience" className="form-label">Experience (years)</label>
                <input
                  id="reqExperience"
                  type="number"
                  className="form-input"
                  placeholder="e.g. 3"
                  value={reqExperience}
                  onChange={(e) => setReqExperience(e.target.value)}
                  required
                  min="0"
                />
              </div>
            </div>

            {/* Profile */}
            <div className="form-group">
              <label htmlFor="postProfile" className="form-label">Job Profile / Title</label>
              <input
                id="postProfile"
                type="text"
                className="form-input"
                placeholder="e.g. Senior React Developer"
                value={postProfile}
                onChange={(e) => setPostProfile(e.target.value)}
                required
              />
            </div>

            {/* Description */}
            <div className="form-group">
              <label htmlFor="postDesc" className="form-label">Job Description</label>
              <textarea
                id="postDesc"
                className="form-textarea"
                placeholder="Describe the role, responsibilities, and requirements…"
                value={postDesc}
                onChange={(e) => setPostDesc(e.target.value)}
                required
              />
            </div>

            <div className="form-divider" />

            {/* Skills */}
            <div>
              <p className="skills-section-label">Required Tech Stack</p>
              <div className="skills-grid">
                {skillSet.map((skill) => (
                  <div key={skill.name} className="skill-toggle">
                    <input
                      type="checkbox"
                      id={`skill-${skill.name}`}
                      checked={postTechStack.includes(skill.name)}
                      onChange={() => handleSkillChange(skill.name)}
                    />
                    <label htmlFor={`skill-${skill.name}`} className="skill-label">
                      <span className="skill-check-icon">
                        <CheckIcon />
                      </span>
                      {skill.name}
                    </label>
                  </div>
                ))}
              </div>
            </div>

            {/* Actions */}
            <div className="form-actions">
              <button
                type="button"
                className="btn-secondary"
                onClick={() => navigate('/')}
              >
                Cancel
              </button>
              <button
                id="submit-create"
                type="submit"
                className="btn-primary"
                disabled={loading}
              >
                {loading
                  ? 'Publishing…'
                  : (
                    <>
                      <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2.5" strokeLinecap="round" strokeLinejoin="round">
                        <line x1="22" y1="2" x2="11" y2="13"/>
                        <polygon points="22 2 15 22 11 13 2 9 22 2"/>
                      </svg>
                      Publish Job
                    </>
                  )
                }
              </button>
            </div>
          </form>
        </div>
      </div>

      {/* Toast */}
      {toast && (
        <div className={`toast ${toast.type}`} role="alert">
          {toast.type === 'success' ? '✓' : '✕'} {toast.message}
        </div>
      )}
    </div>
  );
};

export default Create;
