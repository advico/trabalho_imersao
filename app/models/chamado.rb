class Chamado < ApplicationRecord
  belongs_to :user
  has_one_attached :arquivo

  validates :tipo, presence: true
  validates :categoria, presence: true
  validates :titulo, presence: true, length: { minimum: 5, maximum: 100 }
  validates :descricao, presence: true, length: { minimum: 10 }

  # Validações para o anexo, AGORA SÃO OPCIONAIS
  validate :arquivo_content_type, if: :arquivo_attached?
  validate :arquivo_size, if: :arquivo_attached?

  private

  # Método auxiliar para verificar se um arquivo está anexado
  def arquivo_attached?
    arquivo.attached?
  end

  # Método de validação para o tipo de arquivo
  def arquivo_content_type
    unless arquivo.content_type.in?(%w[application/vnd.oasis.opendocument.text application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document application/pdf image/png image/jpeg])
      errors.add(:arquivo, "deve ser um arquivo ODT, DOC, DOCX, PDF, PNG ou JPEG.")
    end
  end

  # Método de validação para o tamanho do arquivo
  def arquivo_size
    if arquivo.byte_size > 300.kilobytes # 300KB
      errors.add(:arquivo, "não pode ser maior que 300KB.")
    end
  end
end
